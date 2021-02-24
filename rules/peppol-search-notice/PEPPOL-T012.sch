<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for search notice request</title>

    <ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:4.0"/>
    <ns prefix="query" uri="urn:oasis:names:tc:ebxml-regrep:xsd:query:4.0"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>


    <pattern>
        <rule context="query:QueryResponse">
            <assert id="PEPPOL-T012-R001" flag="fatal" test="(rim:Slot[@name='SpecificationIdentification'])">A Search Notice Response MUST have a specification identification.</assert>
            <assert id="PEPPOL-T012-R002" flag="fatal" test="(rim:Slot[@name='BusinessProcessTypeIdentifier'])">A Search Notice Response MUST have a business process type identifier.</assert>
            <assert id="PEPPOL-T012-R003" flag="fatal" test="(rim:Slot[@name='Issue'])">A Search Notice Response MUST have a issue dateTime.</assert>
            <assert id="PEPPOL-T012-R004" flag="fatal" test="(rim:Slot[@name='SenderElectronicAddress'])">A Search Notice Response MUST have a sender electronic address.</assert>
            <assert id="PEPPOL-T012-R005" flag="fatal" test="(rim:Slot[@name='ReceiverElectronicAddress'])">A Search Notice Response MUST have a receiver electronic address.</assert>
        </rule>

        <rule context="*/rim:Value">
            <assert id="PEPPOL-T012-R007" flag="fatal" test="./text()[normalize-space() != '']">Value MUST have a text.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='SpecificationIdentification']">
            <assert id="PEPPOL-T012-R008" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:www.cenbii.eu:transaction:biitrdm100:ver3.0:extended:urn:fdc:peppol.eu:2021:pracc:t012:ver1.0']">A value for Specification Id MUST be given.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='BusinessProcessTypeIdentifier']">
            <assert id="PEPPOL-T012-R009" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:fdc:peppol.eu:2020:pracc:p006:01:1.0']">A value for Business Process Type Identifier MUST be given.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='Issue']">
            <assert id="PEPPOL-T012-R010" flag="fatal" test="rim:SlotValue[@xsi:type='rim:DateTimeValueType']/rim:Value">A value for Issue MUST be given.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='SenderElectronicAddress']">
            <assert id="PEPPOL-T012-R012" flag="fatal" test="matches(normalize-space(./@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A EndpointId MUST have an attribute type.</assert>
            <assert id="PEPPOL-T012-R013" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='ReceiverElectronicAddress']">
            <assert id="PEPPOL-T012-R015" flag="fatal" test="matches(normalize-space(./@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A EndpointId MUST have an attribute type.</assert>
            <assert id="PEPPOL-T012-R016" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject">
            <assert id="PEPPOL-T012-R017" flag="fatal" test="normalize-space(./@lid) != ''">The Registry Object List MUST have an attribute lid.</assert>
            <assert id="PEPPOL-T012-R018" flag="fatal" test="@xsi:type='rim:ExtrinsicObjectType'">A EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
            <assert id="PEPPOL-T012-R019" flag="fatal" test="rim:Slot[@name='BuyerElectronicAddress']">A Registry Object MUST have an BuyerElectronicAddress.</assert>
            <assert id="PEPPOL-T012-R020" flag="fatal" test="matches(normalize-space(rim:Slot[@name='BuyerElectronicAddress']/@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">A BuyerElectronicAddress MUST have an attribute type.</assert>
            <assert id="PEPPOL-T012-R021" flag="fatal" test="rim:Slot[@name='BuyerElectronicAddress']/rim:SlotValue[@xsi:type='rim:StringValueType']">A BuyerElectronicAddress MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
            <assert id="PEPPOL-T012-R022" flag="fatal" test="rim:Slot[@name='DocumentTypeCode']">A Registry Object MUST have a Document Type Code.</assert>
            <assert id="PEPPOL-T012-R023" flag="fatal" test="rim:RepositoryItemRef">A Registry Object MUST have a Repository Item Ref.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='DocumentTypeCode']">
            <assert id="PEPPOL-T011-R024" flag="fatal" test="@type = 'http://docs.peppol.eu/document-type-code'">A Document Type Code MUST have a type of the value of "http://docs.peppol.eu/document-type-code".</assert>
            <assert id="PEPPOL-T012-R025" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A Document Type Code MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:RepositoryItemRef">
            <assert id="PEPPOL-T011-R026" flag="fatal" test="normalize-space(@xlink:href) != ''">A Document Type Code MUST have a type of the value of "http://docs.peppol.eu/document-type-code".</assert>
        </rule>

    </pattern>
</schema>
