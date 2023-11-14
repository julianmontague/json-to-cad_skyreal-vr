/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package no.aakp.digicat.json.to.cad.skyreal.vr;

import jsdai.lang.Implementation;
import jsdai.lang.SdaiException;
import jsdai.lang.SdaiSession;

/**
 * Example usage of JSDAI from https://doc.jsdai.net/jsdai_doc/jsdai_introduction/HelloSDAI.html
 *
 * @author LKSoft
 */
public class HelloSDAI {
    // Prevent this class from being instantiated by supressing default constructor
    private HelloSDAI() {
        throw new AssertionError();
    }

    public static String example() throws SdaiException {
        SdaiSession session = SdaiSession.openSession();
        Implementation imp = session.getSdaiImplementation();
        // System.out.println("Hello " + imp.getName());
        String name = imp.getName();
        session.closeSession();
        return "Hello " + name;
    }
}
