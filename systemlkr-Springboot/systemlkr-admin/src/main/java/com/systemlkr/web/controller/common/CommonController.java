package com.systemlkr.web.controller.common;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.systemlkr.common.utils.COSUtil;
import com.systemlkr.common.utils.uuid.IdUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.systemlkr.common.config.systemlkrConfig;
import com.systemlkr.common.constant.Constants;
import com.systemlkr.common.core.domain.AjaxResult;
import com.systemlkr.common.utils.StringUtils;
import com.systemlkr.common.utils.file.FileUtils;
import com.systemlkr.framework.config.ServerConfig;

/**
 * 通用请求处理
 * 
 * @author systemlkr
 */
@RestController
@RequestMapping("/common")
public class CommonController
{
    private static final Logger log = LoggerFactory.getLogger(CommonController.class);

    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private COSUtil cosUtil;

    private static final String FILE_DELIMETER = ",";

    /**
     * 通用下载请求
     * 
     * @param fileName 文件名称
     * @param delete 是否删除
     */
    @GetMapping("/download")
    public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request)
    {
        try
        {
            if (!FileUtils.checkAllowDownload(fileName))
            {
                throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
            }
            String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
            String filePath = systemlkrConfig.getDownloadPath() + fileName;

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, realFileName);
            FileUtils.writeBytes(filePath, response.getOutputStream());
            if (delete)
            {
                FileUtils.deleteFile(filePath);
            }
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }

    /**
     * 通用上传请求（单个）
     */
/*    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = systemlkrConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", fileName);
            ajax.put("newFileName", FileUtils.getName(fileName));
            ajax.put("originalFilename", file.getOriginalFilename());
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }
    */

    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file) throws Exception {
        if (file == null || file.isEmpty()) {
            return AjaxResult.error("上传文件为空");
        }

        String filename = file.getOriginalFilename();
        String ext = filename.substring(filename.lastIndexOf("."));
        String key = "upload/upload/" + IdUtils.simpleUUID() + ext;

        String url = cosUtil.uploadFile(key, file.getInputStream(), file.getSize(), file.getContentType());

        AjaxResult ajax = AjaxResult.success();
        ajax.put("url", url);
        ajax.put("fileName", key);
        ajax.put("newFileName", key);
        ajax.put("originalFilename", file.getOriginalFilename());
        return ajax;
    }


    /**
     * 通用上传请求（多个）
     */
/*    @PostMapping("/uploads")
    public AjaxResult uploadFiles(List<MultipartFile> files) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = systemlkrConfig.getUploadPath();
            List<String> urls = new ArrayList<String>();
            List<String> fileNames = new ArrayList<String>();
            List<String> newFileNames = new ArrayList<String>();
            List<String> originalFilenames = new ArrayList<String>();

            for (MultipartFile file : files)
            {
                // 上传并返回新文件名称
                String fileName = FileUploadUtils.upload(filePath, file);
                String url = serverConfig.getUrl() + fileName;
                urls.add(url);
                fileNames.add(fileName);
                newFileNames.add(FileUtils.getName(fileName));
                originalFilenames.add(file.getOriginalFilename());
            }

            AjaxResult ajax = AjaxResult.success();
            ajax.put("urls", StringUtils.join(urls, FILE_DELIMETER));
            ajax.put("fileNames", StringUtils.join(fileNames, FILE_DELIMETER));
            ajax.put("newFileNames", StringUtils.join(newFileNames, FILE_DELIMETER));
            ajax.put("originalFilenames", StringUtils.join(originalFilenames, FILE_DELIMETER));
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }*/
    @PostMapping("/uploads")
    public AjaxResult uploadFiles(List<MultipartFile> files) throws Exception {
        List<String> urls = new ArrayList<>();
        List<String> keys = new ArrayList<>();
        List<String> newFileNames = new ArrayList<>();
        List<String> originalFilenames = new ArrayList<>();

        for (MultipartFile file : files) {
            if (file.isEmpty()) continue;
            String filename = file.getOriginalFilename();
            String ext = filename.substring(filename.lastIndexOf("."));
            String key = "upload/upload/" + IdUtils.simpleUUID() + ext;
            String url = cosUtil.uploadFile(key, file.getInputStream(), file.getSize(), file.getContentType());

            urls.add(url);
            keys.add(key);
            newFileNames.add(key);
            originalFilenames.add(filename);
        }

        AjaxResult ajax = AjaxResult.success();
        ajax.put("urls", StringUtils.join(urls, ","));
        ajax.put("fileNames", StringUtils.join(keys, ","));
        ajax.put("newFileNames", StringUtils.join(newFileNames, ","));
        ajax.put("originalFilenames", StringUtils.join(originalFilenames, ","));
        return ajax;
    }


    /**
     * 本地资源通用下载
     */
    @GetMapping("/download/resource")
    public void resourceDownload(String resource, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        try
        {
            if (!FileUtils.checkAllowDownload(resource))
            {
                throw new Exception(StringUtils.format("资源文件({})非法，不允许下载。 ", resource));
            }
            // 本地资源路径
            String localPath = systemlkrConfig.getProfile();
            // 数据库资源地址
            String downloadPath = localPath + StringUtils.substringAfter(resource, Constants.RESOURCE_PREFIX);
            // 下载名称
            String downloadName = StringUtils.substringAfterLast(downloadPath, "/");
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, downloadName);
            FileUtils.writeBytes(downloadPath, response.getOutputStream());
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }
}
