package com.systemlkr.common.utils;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.*;
import com.qcloud.cos.region.Region;
import com.systemlkr.common.config.COSConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class COSUtil {

    private final COSConfig cosConfig;

    private COSClient getClient() {
        COSCredentials cred = new BasicCOSCredentials(cosConfig.getSecretId(), cosConfig.getSecretKey());
        ClientConfig clientConfig = new ClientConfig(new Region(cosConfig.getRegion()));
        return new COSClient(cred, clientConfig);
    }

    /**
     * 上传文件（支持 File 或 InputStream）
     */
    public String uploadFile(String key, File file) {
        COSClient cosClient = getClient();
        PutObjectRequest putObjectRequest = new PutObjectRequest(cosConfig.getBucket(), key, file);
        cosClient.putObject(putObjectRequest);
        cosClient.shutdown();
        return cosConfig.getPrefix() + "/" + key;
    }

    public String uploadFile(String key, InputStream input, long contentLength, String contentType) {
        COSCredentials cred = new BasicCOSCredentials(cosConfig.getSecretId(), cosConfig.getSecretKey());
        ClientConfig clientConfig = new ClientConfig(new Region(cosConfig.getRegion()));
        COSClient cosClient = new COSClient(cred, clientConfig);

        ObjectMetadata metadata = new ObjectMetadata();
        metadata.setContentLength(contentLength);
        metadata.setContentType(contentType);

        PutObjectRequest putObjectRequest = new PutObjectRequest(
                cosConfig.getBucket(),
                key,
                input,
                metadata
        );

        PutObjectResult result = cosClient.putObject(putObjectRequest);
        cosClient.shutdown();

        return cosConfig.getPrefix() + "/" + key;
    }

    /**
     * 下载文件
     */
    public COSObjectInputStream download(String key) {
        COSClient cosClient = getClient();
        GetObjectRequest getObjectRequest = new GetObjectRequest(cosConfig.getBucket(), key);
        COSObject object = cosClient.getObject(getObjectRequest);
        return object.getObjectContent(); // 用完后要 close()
    }

    /**
     * 删除文件
     */
    public void delete(String key) {
        COSClient cosClient = getClient();
        cosClient.deleteObject(cosConfig.getBucket(), key);
        cosClient.shutdown();
    }

    /**
     * 列举 Bucket 下的所有文件
     */
    public List<String> listAllKeys(String prefix) {
        COSClient cosClient = getClient();
        ListObjectsRequest request = new ListObjectsRequest();
        request.setBucketName(cosConfig.getBucket());
        request.setPrefix(prefix);
        ObjectListing listing = cosClient.listObjects(request);
        List<String> keys = new ArrayList<>();
        for (COSObjectSummary summary : listing.getObjectSummaries()) {
            keys.add(summary.getKey());
        }
        cosClient.shutdown();
        return keys;
    }
}
