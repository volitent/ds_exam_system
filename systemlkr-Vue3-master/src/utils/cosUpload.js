import COS from 'cos-js-sdk-v5'

// 初始化你的 COS 客户端（推荐后端签名方式，以下是临时演示）
const cos = new COS({
    SecretId: import.meta.env.VITE_COS_SECRET_ID || '',
    SecretKey: import.meta.env.VITE_COS_SECRET_KEY || '',
    protocol: 'https:'

})

export function uploadToCOS(file, fileName) {
    return new Promise((resolve, reject) => {
        cos.putObject({
            Bucket: 'paper-1302415821', // bucket名称
            Region: 'ap-chongqing', // 你的region
            Key: `upload/${fileName}`,
            Body: file,
            onProgress: function (progressData) {
                console.log(JSON.stringify(progressData))
            }
        }, function (err, data) {
            if (!err) {
                const url = `https://${data.Location}`
                resolve(url)
            } else {
                reject(err)
            }
        })
    })
}


export function uploadAvatarToCOS(file, filename) {
    return new Promise((resolve, reject) => {
        cos.putObject({
            Bucket: 'paper-1302415821',
            Region: 'ap-chongqing',
            Key: `avatar/${filename}`,
            Body: file,
            onProgress(progressData) {
                console.log('上传中...', progressData)
            }
        }, function (err, data) {
            if (!err) {
                const url = `https://${data.Location}`
                resolve(url)
            } else {
                reject(err)
            }
        })
    })
}
