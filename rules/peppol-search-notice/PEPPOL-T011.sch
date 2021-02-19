<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for search notice request</title>

    <ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:4.0" />
    <ns prefix="query" uri="urn:oasis:names:tc:ebxml-regrep:xsd:query:4.0" />
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance" />

    <pattern>
        <rule context="query:QueryRequest">
            <assert id="PEPPOL-T011-R001" flag="fatal" test="(rim:Slot[@name='SpecificationIdentification'])">A Search Notice Request MUST have a specification identification.</assert>
            <assert id="PEPPOL-T011-R002" flag="fatal" test="(rim:Slot[@name='BusinessProcessTypeIdentifier'])">A Search Notice Request MUST have a business process type identifier.</assert>
            <assert id="PEPPOL-T011-R003" flag="fatal" test="(rim:Slot[@name='Issue'])">A Search Notice Request MUST have a issue dateTime.</assert>
            <assert id="PEPPOL-T011-R004" flag="fatal" test="(rim:Slot[@name='SenderElectronicAddress'])">A Search Notice Request MUST have a sender electronic address.</assert>
            <assert id="PEPPOL-T011-R005" flag="fatal" test="(rim:Slot[@name='ReceiverElectronicAddress'])">A Search Notice Request MUST have a receiver electronic address.</assert>
            <assert id="PEPPOL-T011-R006" flag="fatal" test="(query:Query[@queryDefinition='SearchNotice'])">A Search Notice Request MUST have a Query with a queryDefinition set to 'SearchNotice'.</assert>
        </rule>

        <rule context="query:QueryRequest/rim:Slot[@name='SpecificationIdentification']">
            <assert test="." />
        </rule>
        <rule context="query:QueryRequest/rim:Slot[@name='BusinessProcessTypeIdentifier']">
            <assert test="." />
        </rule>
        <rule context="query:QueryRequest/rim:Slot[@name='Issue']">
            <assert test="." />
        </rule>
        <rule context="query:QueryRequest/rim:Slot[@name='SenderElectronicAddress']">
            <assert id="PEPPOL-T011-R007" flag="fatal" test="rim:Slot[@name='EndpointId']">A Receiver Electronic Address MUST have an EndpointId.</assert>
            <assert id="PEPPOL-T011-R008" flag="fatal" test="matches(normalize-space(rim:Slot[@name='EndpointId']/@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A EndpointId MUST have an attribute type.</assert>
            <assert id="PEPPOL-T011-R009" flag="fatal" test="rim:Slot[@name='EndpointId']/rim:SlotValue[@xsi:type='rim:StringValueType']">A EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryRequest/rim:Slot[@name='ReceiverElectronicAddress']">
            <assert id="PEPPOL-T011-R010" flag="fatal" test="rim:Slot[@name='EndpointId']">A Receiver Electronic Address MUST have an EndpointId.</assert>
            <assert id="PEPPOL-T011-R011" flag="fatal" test="matches(normalize-space(rim:Slot[@name='EndpointId']/@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A EndpointId MUST have an attribute type.</assert>
            <assert id="PEPPOL-T011-R012" flag="fatal" test="rim:Slot[@name='EndpointId']/rim:SlotValue[@xsi:type='rim:StringValueType']">A EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="/query:QueryRequest/query:Query/rim:Slot[@name='Keywords']">
            <assert id="PEPPOL-T011-R013" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() != '']">A value for Keywords MUST be given.</assert>
        </rule>
    </pattern>

</schema>
