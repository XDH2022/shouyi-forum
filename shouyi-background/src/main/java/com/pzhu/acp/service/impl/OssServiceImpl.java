package com.pzhu.acp.service.impl;

import cn.hutool.core.date.DateUtil;
import com.pzhu.acp.service.OssService;
import com.pzhu.acp.oss.OssInitConstant;
import io.minio.BucketExistsArgs;
import io.minio.MakeBucketArgs;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.UUID;

/**
 * @Auther: gali
 * @Date: 2022-11-13 20:57
 * @Description:
 */
@Service
public class OssServiceImpl implements OssService {

    @Override
    public String uploadFileAvatar(MultipartFile file) {
        String endPoint = OssInitConstant.END_POINT;
        String accessKey = OssInitConstant.ACCESS_KEY;
        String secretKey = OssInitConstant.SECRET_KEY;
        String bucketName = OssInitConstant.BUCKET_NAME;
        try {
            // 创建MinioClient对象
            MinioClient minioClient =
                    MinioClient.builder()
                            .endpoint(endPoint)
                            .credentials(accessKey, secretKey)
                            .build();

            // 创建bucket
            boolean found =
                    minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build());
            if (!found) {
                // Make a new bucket called 'asiatrip'.
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
            } else {
                System.out.println("Bucket '" + bucketName + "' already exists.");
            }

            //获取上传文件名称
            // 1 每个上传文件名称唯一的   uuid生成 01.jpg
            //2 根据当前日期对上传文件进行分组 20230910

            // 20230910/u7r54209l097501.jpg
            String dateDir = DateUtil.format(new Date(), "yyyyMMdd");
            String uuid = UUID.randomUUID().toString().replaceAll("-","");
            String filename = dateDir+"/"+uuid+file.getOriginalFilename();

            // 文件上传
            minioClient.putObject(
                    PutObjectArgs.builder().bucket(bucketName)
                            .object(filename)
                            .stream(file.getInputStream(), file.getSize(), -1)
                            .build());

            //获取上传文件在minio路径
            //http://127.0.0.1:9000/spzx-bucket/01.jpg
            String url = endPoint + "/" + bucketName + "/" + filename;

            return url;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
