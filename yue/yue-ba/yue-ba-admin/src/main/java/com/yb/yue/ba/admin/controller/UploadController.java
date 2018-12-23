package com.yb.yue.ba.admin.controller;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class UploadController {
    //保存文件的目录
    private static final String FILE_UPLOAD_PATH = "static" + File.separator + "upload";
    /**
     * 图片上传
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/upload")
    public Map<String, Object> upload(MultipartFile uploadFile, MultipartFile[] editorFileName, HttpServletRequest request) throws IOException {
        String path=null;
        Map<String,Object> map= Maps.newHashMap();
        //DropZone上传
        if(uploadFile!=null){
            path = getString(uploadFile, request);
            map.put("path",path);
        }
        //Wang Editor上传
        else{
            List<String> paths = Lists.newArrayList();
            for (MultipartFile editorFile : editorFileName) {
                path = getString(editorFile, request);
                paths.add(path);
            }
            map.put("errno",0);
            map.put("data",paths);
        }
        return map;
    }

    private String getString(MultipartFile uploadFile, HttpServletRequest request) throws IOException {
        //获取upload目录在服务器的绝对路径
        String realPath = request.getServletContext().getRealPath(FILE_UPLOAD_PATH);
        File file=new File(realPath);
        if(!file.exists()){
            file.mkdirs();
        }
        //文件名
        String fileName=uploadFile.getOriginalFilename();
        //保存的文件名
        String saveFileName= UUID.randomUUID().toString().replaceAll("-","")+fileName;
        file=new File(file, saveFileName);
        //保存文件
        uploadFile.transferTo(file);
        //将图片绝对路径返回给前端
        return String.format("%s://%s:%s/%s/%s", request.getScheme(),request.getServerName(),request.getServerPort(),FILE_UPLOAD_PATH,saveFileName);
    }
}
