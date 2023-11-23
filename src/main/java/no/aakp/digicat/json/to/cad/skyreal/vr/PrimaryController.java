/* Controller for the primary JavaFX scene.
Copyright (C) 2023 ÅKP AS
This file is part of json-to-cad-skyreal-vr.
SPDX-License-Identifier: AGPL-3.0-only */
package no.aakp.digicat.json.to.cad.skyreal.vr;

import java.io.IOException;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import jsdai.lang.SdaiException;

public class PrimaryController {
    @FXML private VBox labelContainer;

    @FXML
    private void switchToSecondary() throws IOException {
        App.setRoot("secondary");
    }

    @FXML
    private void runHelloSdai() {
        Label label = new Label();
        labelContainer.getChildren().add(label);
        try {
            label.setText(HelloSDAI.example());
        } catch (SdaiException e) {
            label.setText(e.toString());
        }
    }
}
