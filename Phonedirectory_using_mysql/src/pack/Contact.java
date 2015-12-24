/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

/**
 *
 * @author cb-vishal
 */
public class Contact {
    private String name="";
    private String add="";
    private String mobile="";
    private String home="";
    private String work="";

    public enum Person {

        NAME("Name"),
        ADDRESS("Address"),
        MOBILE("Mobile"),
        HOME("Home"),
        WORK("Work");

        private String att;

        private Person(String att) {
            this.att = att;
        }

        public String value() {
            return att;
        }
    }

    public void setName(String name) {
        this.name = name;
        
    }

    public void setAdd(String add) {
        this.add = add;

    }

    public void setMobile(String mobile) {
        this.mobile = mobile;

    }

    public void setHome(String home) {
        this.home = home;

    }

    public void setWork(String work) {
        this.work = work;

    }

    public String getname() {
        return name;

    }

    public String getAdd() {
        return add;

    }

    public String getMobile() {
        return mobile;

    }

    public String getHome() {
        return home;

    }

    public String getWork() {
        return work;

    }

    public String toString() {
        return("Name:"+name+"\nAddress:"+add+"\nMobile:"+mobile+"\nHome:"+home+"\nWork:"+work);

    }
    
}
