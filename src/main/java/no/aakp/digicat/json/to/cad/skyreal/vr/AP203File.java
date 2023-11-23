/* A non-functional attempt to write out an AP203 file.
Copyright (C) 2023 ÅKP AS
This file is part of json-to-cad-skyreal-vr.
SPDX-License-Identifier: AGPL-3.0-only */
package no.aakp.digicat.json.to.cad.skyreal.vr;

import java.io.PrintWriter;
import jsdai.SAp203_configuration_controlled_3d_design_of_mechanical_parts_and_assemblies_mim.CMechanical_context;
import jsdai.SAp203_configuration_controlled_3d_design_of_mechanical_parts_and_assemblies_mim.EMechanical_context;
import jsdai.SApplication_context_schema.*;
import jsdai.SProduct_definition_schema.CProduct;
import jsdai.SProduct_definition_schema.EProduct;
import jsdai.lang.Implementation;
import jsdai.lang.SdaiException;
import jsdai.lang.SdaiModel;
import jsdai.lang.SdaiRepository;
import jsdai.lang.SdaiSession;
import jsdai.lang.SdaiTransaction;

/**
 * Represents an AP203 "Configuration controlled 3D designs of mechanical parts
 * and assemblies" STEP file.
 *
 * @author Julian Montague
 */
public class AP203File {
    public static void example() throws SdaiException {
        SdaiSession.setLogWriter(new PrintWriter(System.out, true));
        SdaiSession session = SdaiSession.openSession();
        SdaiTransaction transaction = session.startTransactionReadWriteAccess();
        // create a temporary repository in the default location (repositories directory)
        SdaiRepository repo = session.createRepository("", null);
        repo.openRepository();

        /*
        BackToCAD files don't have a description, and it's unlikely that the
        user will want to write one themself, so don't set one.

        BackToCAD files contain no provenance information, so we can't set the
        author or organization.
        */
        // the system used to create this STEP file
        Implementation impl = session.getSdaiImplementation();
        repo.setPreprocessorVersion(impl.getName() + " " + impl.getLevel());
        // TODO: append BackToCAD.json api_version here
        repo.setOriginatingSystem("SkyReal VR BackToCAD");

        SdaiModel model = repo.createSdaiModel("Model1",
            jsdai.SAp203_configuration_controlled_3d_design_of_mechanical_parts_and_assemblies_mim.SAp203_configuration_controlled_3d_design_of_mechanical_parts_and_assemblies_mim.class);
        model.startReadWriteAccess();

        EApplication_context appContext = (EApplication_context)
            model.createEntityInstance(CApplication_context.class);
        appContext.setApplication(null,
            "configuration controlled 3d design of mechanical parts and assemblies");

        EApplication_protocol_definition appProtocol =
            (EApplication_protocol_definition)
            model.createEntityInstance(CApplication_protocol_definition.class);
        appProtocol.setApplication_protocol_year(null, 1994);

        EMechanical_context mechanical = (EMechanical_context)
            model.createEntityInstance(CMechanical_context.class);
        mechanical.setFrame_of_reference(null, appContext);

        EProduct product = (EProduct) model.createEntityInstance(CProduct.class);
        product.setId(null, "TestId");
        product.setName(null, "TestName");
        product.setDescription(null, "TestDescription");
        AProduct_context contexts = product.createFrame_of_reference(null);
        contexts.addUnordered(mechanical);

        /*
        TODO: determine whether to use
        https://doc.jsdai.net/jsdai_doc/api_ref/jsdai/lang/SdaiRepository.html#exportClearTextEncoding(java.io.OutputStream)
        in order to choose an absolute path.
        Currently I assume that this file will be created relative to where
        the program is run from.
        */
        repo.exportClearTextEncoding("test-jsdai-output.stp");

        repo.closeRepository();
        repo.deleteRepository();
        // we don't intend to persist the data, so abort
        // ending the transaction also ends all access to models
        transaction.endTransactionAccessAbort();
        session.closeSession();
    }
}
