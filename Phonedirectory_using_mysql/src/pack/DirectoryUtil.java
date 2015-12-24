/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pack;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import pack.Contact.Person;

/**
 *
 * @author cb-vishal
 */
public class DirectoryUtil {

    public static List<Contact> loadJson(String path) throws Exception {
        List<Contact> directory = new ArrayList<Contact>();
        File file = new File(path);
        BufferedReader read = new BufferedReader(new FileReader(file));
        String str = read.readLine();
        System.out.println(str);
        JSONObject obj = new JSONObject(str);

        JSONArray contact = (JSONArray) obj.get("PhoneDirectory");

        for (int i = 0; i < contact.length(); i++) {

            Contact con = new Contact();
            JSONObject mobj = (JSONObject) contact.getJSONObject(i);
            con.setName(mobj.get(Person.NAME.value()).toString());
            con.setAdd(mobj.get(Person.ADDRESS.value()).toString());
            con.setMobile(mobj.get(Person.MOBILE.value()).toString());
            con.setWork(mobj.get(Person.WORK.value()).toString());
            con.setHome(mobj.get(Person.HOME.value()).toString());

            directory.add(con);

        }
        return directory;
    }
}
