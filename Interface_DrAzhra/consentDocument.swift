//
//  consentTask.swift
//  Interface_DrAzhra
//
//  Created by Bishal Gautam on 7/5/16.
//  Copyright © 2016 Bishal Gautam. All rights reserved.
//

import Foundation
import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "Example Consent"
    
    //TODO: consent sections
    let consentSectionTypes: [ORKConsentSectionType] = [
        .Overview,
//        .DataGathering,
//        .Privacy,research
        .DataUse,
        .TimeCommitment,
        .StudySurvey,
//        .StudyTasks,
//        .Withdrawing
    ]
    
    var consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = "If you wish to complete this study..."
        consentSection.content = "In this study you will be asked five (wait, no, three!) questions. You will also have your voice recorded for ten seconds."
        //consentSection.customImage = UIImage(named : "images")
        return consentSection
    }
    
    consentDocument.sections = consentSections
    //TODO: signature
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    return consentDocument
}