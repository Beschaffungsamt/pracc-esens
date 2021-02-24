/*
 * This Spock specification was generated by the Gradle 'init' task.
 */
package eu.peppol.pracc

import com.helger.commons.io.resource.URLResource
import com.helger.schematron.sch.SchematronResourceSCH
import com.helger.schematron.svrl.jaxb.FailedAssert
import com.helger.schematron.svrl.jaxb.SchematronOutputType
import com.helger.schematron.svrl.jaxb.SuccessfulReport
import com.helger.xml.transform.ResourceStreamSource
import groovy.util.logging.Slf4j
import spock.lang.Specification

import javax.xml.XMLConstants
import javax.xml.transform.stream.StreamSource
import javax.xml.validation.SchemaFactory

@Slf4j
class SchematronSpecification extends Specification {

    def 'run schematron on instances'() {
        given:
        def schematronFile = new File(schematronFileName)
        def schematronResource = SchematronResourceSCH.fromFile(schematronFile)

        when:
        def xmlFile = new File(xmlFileName)

        SchematronOutputType result = null
        schematronResource.setAllowForeignElements(true)
        xmlFile.withInputStream { InputStream is ->
            result = schematronResource.applySchematronValidationToSVRL(new StreamSource(is))
        }

        def failedAsserts = result?.getActivePatternAndFiredRuleAndFailedAssert()?.findAll { it instanceof FailedAssert || it instanceof SuccessfulReport }
        failedAsserts?.each {
            log.error("found ${it.id}: '${it.text.content}' when validating ${xmlFile.absolutePath} with ${schematronFile.name}")
        }


        then:
        failedAsserts?.isEmpty() && result != null

        where:
        schematronFileName                                                       | xmlFileName
        'rules/peppol-procurement-procedure-subscription-1.0/ESENS-UBL-T001.sch' | 'guides/transactions/T001/files/ExpressionOfInterestRequest-instance.xml'
        'rules/peppol-procurement-procedure-subscription-1.0/ESENS-UBL-T002.sch' | 'guides/transactions/T002/files/ExpressionOfInterestResponse-instance.xml'
        'rules/peppol-tender-status-inquiry-1.0/ESENS-UBL-T003.sch'              | 'guides/transactions/T003/files/TenderStatusRequest-instance.xml'
        'rules/peppol-call-for-tender-1.0/peppol/ESENS-UBL-T004.sch'             | 'guides/transactions/T004/files/call-for-tenders-instance.xml'
        'rules/peppol-tender-1.0/peppol/ESENS-UBL-T005.sch'                      | 'guides/transactions/T005/files/tender-instance.xml'
        'rules/peppol-tender-1.0/peppol/ESENS-UBL-T006.sch'                      | 'guides/transactions/T006/files/tender-receipt-instance.xml'
        'rules/peppol-call-for-tender-question-and-answers-1.0/PEPPOL-T007.sch'  | 'guides/transactions/T007/files/TenderingQuestions-doc.xml'
        'rules/peppol-call-for-tender-question-and-answers-1.0/PEPPOL-T008.sch'  | 'guides/transactions/T008/files/TenderingAnswers-doc.xml'
        'rules/tender-clarification-1.0/PEPPOL-T009.sch'                         | 'guides/transactions/T009/files/TenderClarificationRequest-doc.xml'
        'rules/tender-clarification-1.0/PEPPOL-T010.sch'                         | 'guides/transactions/T010/files/TenderClarification-doc.xml'
        'rules/peppol-search-notice/PEPPOL-T011.sch'                             | 'guides/transactions/T011/files/ExampleSearchNoticeRequest.xml'
        'rules/peppol-search-notice/PEPPOL-T012.sch'                             | 'guides/transactions/T012/files/ExampleSearchNoticeResponse.xml'
    }

    def 'XSD schema validation'() {

        given:
        def factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
        def xsdSource = this.class.classLoader.getResource(xsd)
        def schema = factory.newSchema(new ResourceStreamSource(new URLResource(xsdSource)))
        def validator = schema.newValidator()

        when:
        validator.validate(new StreamSource(new FileReader(new File(xml))))

        then:
        noExceptionThrown()

        where:
        xml                                                                        | xsd
        'guides/transactions/T001/files/ExpressionOfInterestRequest-instance.xml'  | 'xsdrt/maindoc/UBL-ExpressionOfInterestRequest-2.2.xsd'
        'guides/transactions/T002/files/ExpressionOfInterestResponse-instance.xml' | 'xsdrt/maindoc/UBL-ExpressionOfInterestResponse-2.2.xsd'
        'guides/transactions/T003/files/TenderStatusRequest-instance.xml'          | 'xsdrt/maindoc/UBL-TenderStatusRequest-2.2.xsd'
        'guides/transactions/T004/files/call-for-tenders-instance.xml'             | 'xsdrt/maindoc/UBL-CallForTenders-2.2.xsd'
        'guides/transactions/T005/files/tender-instance.xml'                       | 'xsdrt/maindoc/UBL-Tender-2.2.xsd'
        'guides/transactions/T006/files/tender-receipt-instance.xml'               | 'xsdrt/maindoc/UBL-TenderReceipt-2.2.xsd'
        'guides/transactions/T007/files/TenderingQuestions-doc.xml'                | 'xsdrt/maindoc/UBL-Enquiry-2.2.xsd'
        'guides/transactions/T008/files/TenderingAnswers-doc.xml'                  | 'xsdrt/maindoc/UBL-EnquiryResponse-2.2.xsd'
        'guides/transactions/T009/files/TenderClarificationRequest-doc.xml'        | 'xsdrt/maindoc/UBL-Enquiry-2.2.xsd'
        'guides/transactions/T010/files/TenderClarification-doc.xml'               | 'xsdrt/maindoc/UBL-EnquiryResponse-2.2.xsd'
        'guides/transactions/T011/files/ExampleSearchNoticeRequest.xml'            | 'ebXML/query.xsd'
        'guides/transactions/T012/files/ExampleSearchNoticeResponse.xml'           | 'ebXML/query.xsd'
    }
}
