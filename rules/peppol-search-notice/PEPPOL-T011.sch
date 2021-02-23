<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for search notice request</title>

    <ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:4.0"/>
    <ns prefix="query" uri="urn:oasis:names:tc:ebxml-regrep:xsd:query:4.0"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>

    <pattern>
        <rule context="query:QueryRequest">
            <assert id="PEPPOL-T011-R001" flag="fatal" test="(rim:Slot[@name='SpecificationIdentification'])">A Search Notice Request MUST have a specification identification.</assert>
            <assert id="PEPPOL-T011-R002" flag="fatal" test="(rim:Slot[@name='BusinessProcessTypeIdentifier'])">A Search Notice Request MUST have a business process type identifier.</assert>
            <assert id="PEPPOL-T011-R003" flag="fatal" test="(rim:Slot[@name='Issue'])">A Search Notice Request MUST have a issue dateTime.</assert>
            <assert id="PEPPOL-T011-R004" flag="fatal" test="(rim:Slot[@name='SenderElectronicAddress'])">A Search Notice Request MUST have a sender electronic address.</assert>
            <assert id="PEPPOL-T011-R005" flag="fatal" test="(rim:Slot[@name='ReceiverElectronicAddress'])">A Search Notice Request MUST have a receiver electronic address.</assert>
            <assert id="PEPPOL-T011-R006" flag="fatal" test="(query:Query[@queryDefinition='SearchNotice'])">A Search Notice Request MUST have a Query with a queryDefinition set to 'SearchNotice'.</assert>
        </rule>

        <rule context="*/rim:Value">
            <assert id="PEPPOL-T011-R007" flag="fatal" test="./text()[normalize-space() != '']">Value MUST have a text.</assert>
        </rule>

        <rule context="query:QueryRequest/rim:Slot[@name='SpecificationIdentification']">
            <assert id="PEPPOL-T011-R008" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:fdc:peppol.eu:2021:pracc:t011:1.0']">A value for Specification Id MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/rim:Slot[@name='BusinessProcessTypeIdentifier']">
            <assert id="PEPPOL-T011-R009" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:fdc:peppol.eu:2021:pracc:p006:1.0']">A value for Business Process Type Identifier MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/rim:Slot[@name='Issue']">
            <assert id="PEPPOL-T011-R010" flag="fatal" test="rim:SlotValue[@xsi:type='rim:DateTimeValueType']/rim:Value">A value for Issue MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/rim:Slot[@name='SenderElectronicAddress']">
            <assert id="PEPPOL-T011-R011" flag="fatal" test="rim:Slot[@name='EndpointId']">A Receiver Electronic Address MUST have an EndpointId.</assert>
            <assert id="PEPPOL-T011-R012" flag="fatal" test="matches(normalize-space(rim:Slot[@name='EndpointId']/@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A EndpointId MUST have an attribute type.</assert>
            <assert id="PEPPOL-T011-R013" flag="fatal" test="rim:Slot[@name='EndpointId']/rim:SlotValue[@xsi:type='rim:StringValueType']">A EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryRequest/rim:Slot[@name='ReceiverElectronicAddress']">
            <assert id="PEPPOL-T011-R014" flag="fatal" test="rim:Slot[@name='EndpointId']">A Receiver Electronic Address MUST have an EndpointId.</assert>
            <assert id="PEPPOL-T011-R015" flag="fatal" test="matches(normalize-space(rim:Slot[@name='EndpointId']/@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A EndpointId MUST have an attribute type.</assert>
            <assert id="PEPPOL-T011-R016" flag="fatal" test="rim:Slot[@name='EndpointId']/rim:SlotValue[@xsi:type='rim:StringValueType']">A EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='Keywords']">
            <assert id="PEPPOL-T011-R017" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value">A value for Keywords MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='FormType']">
            <assert id="PEPPOL-T011-R018" flag="fatal" test="@type = 'http://publications.europa.eu/resource/authority/form-type'">A Form Type MUST have a type of the value of "http://publications.europa.eu/resource/authority/form-type".</assert>
            <assert id="PEPPOL-T011-R019" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least element for Form Type MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='NoticeType']">
            <assert id="PEPPOL-T011-R020" flag="fatal" test="@type = 'http://publications.europa.eu/resource/authority/notice-type'">A Notice Type MUST have a type of the value of "http://publications.europa.eu/resource/authority/notice-type".</assert>
            <assert id="PEPPOL-T011-R021" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Notice Type MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='Classification']">
            <assert id="PEPPOL-T011-R022" flag="fatal" test="normalize-space(./@type) != ''">A Classification MUST have a type.</assert>
            <assert id="PEPPOL-T011-R023" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for the Classification MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='ContractNature']">
            <assert id="PEPPOL-T011-R024" flag="fatal" test="@type = 'http://publications.europa.eu/resource/authority/contract-nature'">A Contract Nature MUST have a type of the value of "http://publications.europa.eu/resource/authority/contract-nature".</assert>
            <assert id="PEPPOL-T011-R025" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Contract Nature MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='PlaceOfPerformance']">
            <assert id="PEPPOL-T011-R026" flag="fatal" test="@type = 'http://publications.europa.eu/resource/authority/nuts'">The Place Of Performance MUST have a type of the value of "http://publications.europa.eu/resource/authority/nuts".</assert>
            <assert id="PEPPOL-T011-R027" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for the Place Of Performance MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='TenderValue']">
            <assert id="PEPPOL-T011-R028" flag="fatal" test="count(rim:Slot) > 0">At least one element for Tender Value MUST be given.</assert>
           <!-- <assert id="PEPPOL-T011-R040" flag="fatal" test="count(rim:Slot) < 4">At least one element for Tender Value MUST be given.</assert> -->
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='TenderValue']/rim:Slot[@name='Currency']">
            <assert id="PEPPOL-T011-R029" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/currency'">The Currency of the Tender Value MUST have a type of the value of "http://publications.europa.eu/resource/authority/currency".</assert>
            <assert id="PEPPOL-T011-R030" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for the Currency MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='ProcedureType']">
            <assert id="PEPPOL-T011-R031" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/procurement-procedure-type'">A Procedure Type MUST have a type of the value of "http://publications.europa.eu/resource/authority/procurement-procedure-type".</assert>
            <assert id="PEPPOL-T011-R032" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Procedure Type MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='SubmissionLanguage']">
            <assert id="PEPPOL-T011-R033" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/language'">A Submission Language MUST have a type of the value of "http://publications.europa.eu/resource/authority/language".</assert>
            <assert id="PEPPOL-T011-R034" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Submission Language MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='PublicatonDate']">
            <assert id="PEPPOL-T011-R040" flag="fatal" test="count(rim:Slot) > 0">A Publication Date MUST have at least one slot</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='DeadlineReceiptTenders']">
            <assert id="PEPPOL-T011-R041" flag="fatal" test="count(rim:Slot) > 0">A Deadline Receipt Tenders MUST have at least one slot</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='AdditionalInformationDeadline']">
            <assert id="PEPPOL-T011-R042" flag="fatal" test="count(rim:Slot) > 0">An Additional Information Deadline MUST have at least one slot</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='DeadlineReceiptRequests']">
            <assert id="PEPPOL-T011-R043" flag="fatal" test="count(rim:Slot) > 0">The Deadline Receipt Requests MUST have at least one slot</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='NoticeIdentifier']">
            <assert id="PEPPOL-T011-R044" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Notice Identifier MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='ProcedureIdentifier']">
            <assert id="PEPPOL-T011-R045" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Procedure Identifier MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='ProcedureLegalBasis']">
            <assert id="PEPPOL-T011-R046" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Procedure Legal Basis MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='ReservedParticipation']">
            <assert id="PEPPOL-T011-R047" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/reserved-procurement'">A Reserved Participation MUST have a type of the value of "http://publications.europa.eu/resource/authority/reserved-procurement".</assert>
            <assert id="PEPPOL-T011-R048" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Reserved Participation MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='AwardCriterionType']">
            <assert id="PEPPOL-T011-R049" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/award-criterion-type'">An Award Criterion Type MUST have a type of the value of "http://publications.europa.eu/resource/authority/award-criterion-type".</assert>
            <assert id="PEPPOL-T011-R050" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Award Criterion Type MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='BuyerInformation']">
            <assert id="PEPPOL-T011-R051" flag="fatal" test="count(rim:Slot) > 0">A Buyer Information MUST have at least one slot</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='BuyerInformation']/rim:Slot[@name='OrganizationCountrySubdivision']">
            <assert id="PEPPOL-T011-R052" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/nuts'">An Organization Country Subdivision MUST have a type of the value of "http://publications.europa.eu/resource/authority/nuts".</assert>
            <assert id="PEPPOL-T011-R053" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Organization Country Subdivision MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='BuyerInformation']/rim:Slot[@name='CountryCode']">
            <assert id="PEPPOL-T011-R054" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/country'">A Country Code MUST have a type of the value of "http://publications.europa.eu/resource/authority/country".</assert>
            <assert id="PEPPOL-T011-R055" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Country Code MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='BuyerInformation']/rim:Slot[@name='LegalType']">
            <assert id="PEPPOL-T011-R056" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/buyer-legal-type'">A Legal Type MUST have a type of the value of "http://publications.europa.eu/resource/authority/buyer-legal-type".</assert>
            <assert id="PEPPOL-T011-R057" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Legal Type MUST be given.</assert>
        </rule>

        <rule context="query:QueryRequest/query:Query/rim:Slot[@name='BuyerInformation']/rim:Slot[@name='MainActivity']">
            <assert id="PEPPOL-T011-R058" flag="fatal" test="@type='http://publications.europa.eu/resource/authority/main-activity'">A Main Activity MUST have a type of the value of "http://publications.europa.eu/resource/authority/main-activity".</assert>
            <assert id="PEPPOL-T011-R059" flag="fatal" test="count(rim:SlotValue[@xsi:type='rim:CollectionValueType']/rim:Element[@xsi:type='rim:StringValueType']/rim:Value) > 0">At least one element for Main Activity Type MUST be given.</assert>
        </rule>

    </pattern>

</schema>
