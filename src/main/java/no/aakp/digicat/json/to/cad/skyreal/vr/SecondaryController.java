/* Controller for the secondary JavaFX scene.
Copyright (C) 2023 ÅKP AS
This file is part of json-to-cad-skyreal-vr.
SPDX-License-Identifier: AGPL-3.0-only */
package no.aakp.digicat.json.to.cad.skyreal.vr;

import java.io.IOException;
import javafx.fxml.FXML;

public class SecondaryController {

    @FXML
    private void switchToPrimary() throws IOException {
        App.setRoot("primary");
    }
}