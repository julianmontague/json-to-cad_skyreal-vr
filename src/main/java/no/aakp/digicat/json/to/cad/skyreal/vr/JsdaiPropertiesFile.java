/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package no.aakp.digicat.json.to.cad.skyreal.vr;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.FileAlreadyExistsException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Properties;
import net.harawata.appdirs.AppDirs;
import net.harawata.appdirs.AppDirsFactory;

/**
 * Creates/finds the folder in which to store the jsdai.properties file and the
 * corresponding "repositories" folder.
 *
 * jsdai.properties is required for JSDAI to function. For our uses we do not
 * want to bother the user with creating it themselves, because there is no
 * configuration for them to do.
 *
 * @author Julian Montague
 */
public final class JsdaiPropertiesFile {
    // name of the directory to place the app directory in, for Windows only
    private static final String AUTHOR_DIR_NAME = "AAKP";
    // name of the directory to place the configuration in
    private static final String APP_DIR_NAME = "json-to-cad-skyreal-vr";
    // this must be left unchanged, it is the file name JSDAI looks for
    private static final String PROPERTIES_FILE_NAME = "jsdai.properties";
    // this is the example directory name given by JSDAI
    private static final String REPOS_DIR_NAME = "sdairepos";
    // comment explaining that jsdai.properties is a generated file
    private static final String COMMENT =
    """
     This file is generated every time json-to-cad starts.
     Do not change it, as any changes will be overwritten.
     Changing this file while json-to-cad is running may cause it to malfunction.
     If you believe you need to edit this file, contact the developer.
    """;

    // Prevent this class from being instantiated by supressing default constructor
    private JsdaiPropertiesFile() {
        throw new AssertionError();
    }

    /**
     * Ensures the OS-specific configuration folder for this application exists.
     * Creates the jsdai.properties file in this folder. Creates a subfolder to
     * be specified as the "repositories" property in jsdai.properties.
     *
     * @return the {@code Path} to the folder containing jsdai.properties
     * @throws java.io.IOException if any of the folders or files cannot be created
     */
    public static Path initialize() throws IOException {
        Path dirPath = JsdaiPropertiesFile.createConfigDir();
        Path reposPath = JsdaiPropertiesFile.createReposDir(dirPath);
        // construct the Properties to write to jsdai.properties
        Properties props = new Properties();
        props.setProperty("repositories", reposPath.toString());
        JsdaiPropertiesFile.writeProperties(props, dirPath);
        return dirPath;
    }

    /**
     * Creates the configuration directory.
     *
     * @return the {@code Path} of the configuration directory
     * @throws java.io.IOException if the directory cannot be created
     */
    private static Path createConfigDir() throws IOException {
        AppDirs appDirs = AppDirsFactory.getInstance();
        Path configPath = Path.of(appDirs.getUserConfigDir(APP_DIR_NAME, null, AUTHOR_DIR_NAME));
        try {
            Files.createDirectories(configPath);
        } catch (FileAlreadyExistsException ex) {
            System.err.println(configPath.toString() + " already exists as a file. " +
                "Please rename or delete it in order to use json-to-cad.");
            throw ex;
        } catch (IOException ex) {
            System.err.println("Unable to create configuration folder " +
                configPath.toString());
            throw ex;
        }
        return configPath;
    }

    /**
     * Creates the JSDAI repositories directory.
     *
     * @param path the {@code Path} to create the repositories directory in
     * @return the {@code Path} of the repositories directory
     * @throws java.io.IOException if the directory cannot be created
     */
    private static Path createReposDir(Path path) throws IOException {
        Path reposPath = path.resolve(REPOS_DIR_NAME);
        try {
            Files.createDirectories(reposPath);
        } catch (FileAlreadyExistsException ex) {
            System.err.println(reposPath.toString() + " already exists as a file. " +
                "Please rename or delete it in order to use json-to-cad.");
            throw ex;
        } catch (IOException ex) {
            System.err.println("Unable to create repositories folder " +
                path.toString());
            throw ex;
        }
        return reposPath;
    }

    /**
     * Writes to the jsdai.properties file.
     * If the file doesn't exist, it is created. If it already exists, its
     * contents are overwritten.
     *
     * @param props the {@code Properties} to write to the file
     * @param path the {@code Path} to create the file in
     * @throws java.io.IOException if an IO error occurs
     */
    private static void writeProperties(Properties props, Path path) throws IOException {
        Path jsdaiPropertiesPath = path.resolve(PROPERTIES_FILE_NAME);
        try (OutputStream out = Files.newOutputStream(jsdaiPropertiesPath)) {
            props.store(out, COMMENT);
        }
    }
}
