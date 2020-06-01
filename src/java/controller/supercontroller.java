/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.managerDAO;
import dao.superDAO;
import entity.manager;
import entity.supervisor;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.enterprise.context.SessionScoped;
import javax.inject.Named;

/**
 *
 * @author moj
 */
@Named
@SessionScoped
public class supercontroller implements Serializable {
   private supervisor supervisor;
    private List<supervisor> superlist;
    private superDAO superdao;
    private Long selectedmanager; 
    private managerDAO managerdao;
    private List<manager> managerlist;

      
      @PostConstruct
    public void init (){
        supervisor = new supervisor() ; 
    }
     
    public List<manager> getManagerlist() {
        this.managerlist=this.getManagerdao().getmanager();
        return managerlist;
    }

    public void setManagerlist(List<manager> managerlist) {
        this.managerlist = managerlist;
    }
    
   
    public Long getSelectedmanager() {
        return selectedmanager;
    }

    public managerDAO getManagerdao() {
        if(this.managerdao==null)
            this.managerdao=new managerDAO();
        return managerdao;
    }

    public void setSelectedmanager(Long selectedmanager) {
        this.selectedmanager = selectedmanager;
    }
    
    public void updateForm(supervisor s) {
        this.supervisor = s;
        this.selectedmanager=this.supervisor.getManager().getId_manager();
    }

    public void delete() {
        this.getSuperdao().delete(this.supervisor);
        this.supervisor= new supervisor();
    }

    public void deleteConfirm(supervisor supervisor) {
        this.supervisor = supervisor;
    }

    public void clearForm() {
        this.supervisor = new supervisor();
    }

    public void update() {
        this.getSuperdao().update(this.supervisor,selectedmanager);
        this.supervisor = new supervisor();
    }

    public String create() {
        this.getSuperdao().create(this.supervisor,selectedmanager);
   return"supervisor";

    }


    public supercontroller() {
        this.superlist = new ArrayList();
        superdao = new superDAO();
    }

    public supervisor getSupervisor() {
        return supervisor;
    }

    public void setSupervisor(supervisor supervisor) {
        this.supervisor = supervisor;
    }

    public List<supervisor> getSuperlist() {
        this.superlist=this.getSuperdao().findAll();
        return superlist;
    }

    public void setSuperlist(List<supervisor> superlist) {
        this.superlist = superlist;
    }

    public superDAO getSuperdao() {
        return superdao;
    }

    public void setSuperdao(superDAO superdao) {
        this.superdao = superdao;
    }

  


}

