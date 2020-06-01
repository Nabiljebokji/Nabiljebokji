/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author nabilo
 */
public class Document {

    private String filePlath;
    private String fileName;
    private String fileType;

    public Document() {
    }

    public Document(String filePlath, String fileName, String fileType) {
        this.filePlath = filePlath;
        this.fileName = fileName;
        this.fileType = fileType;
    }

    public String getFilePlath() {
        return filePlath;
    }

    public void setFilePlath(String filePlath) {
        this.filePlath = filePlath;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    @Override
    public String toString() {
        return "Document{" + "filePlath=" + filePlath + ", fileName=" + fileName + ", fileType=" + fileType + '}';
    }

}
