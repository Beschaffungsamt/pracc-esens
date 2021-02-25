<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for search notice request</title>

    <ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:4.0"/>
    <ns prefix="query" uri="urn:oasis:names:tc:ebxml-regrep:xsd:query:4.0"/>
    <ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
    <ns prefix="xlink" uri="http://www.w3.org/1999/xlink"/>

    <pattern>
        <rule context="query:QueryResponse">
            <assert id="PEPPOL-T012-R001" flag="fatal" test="./@requestId">A Notice QueryResponse MUST have an provide a reference to the QueryRequest Identifier.</assert>
            <assert id="PEPPOL-T012-R002" flag="fatal" test="matches(normalize-space(./@requestId), '^[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}$')">The Request Identifier value MUST be expressed in a UUID syntax (RFC 4122).</assert>
            <assert id="PEPPOL-T012-R003" flag="fatal" test="(rim:Slot[@name='SpecificationIdentification'])">A Notice QueryResponse MUST have a SpecificationIdentification.</assert>
            <assert id="PEPPOL-T012-R004" flag="fatal" test="(rim:Slot[@name='BusinessProcessTypeIdentifier'])">A Notice QueryResponse MUST have a BusinessProcessTypeIdentifier.</assert>
            <assert id="PEPPOL-T012-R005" flag="fatal" test="(rim:Slot[@name='IssueDateTime'])">A Notice QueryResponse MUST have an IssueDateTime.</assert>
            <assert id="PEPPOL-T012-R006" flag="fatal" test="(rim:Slot[@name='SenderElectronicAddress'])">A Notice QueryResponse MUST identify the Sender by its party identifier and its SenderElectronicAddress.</assert>
            <assert id="PEPPOL-T012-R007" flag="fatal" test="(rim:Slot[@name='ReceiverElectronicAddress'])">A Notice QueryResponse MUST have a receiver electronic address.</assert>
            <assert id="PEPPOL-T012-R008" flag="fatal" test="(rim:RegistryObjectList)">A NoticeQueryResponse MUST have a Registry Object List. </assert>
        </rule>

        <rule context="*/rim:Value">
            <assert id="PEPPOL-T012-R009" flag="fatal" test="./text()[normalize-space() != '']">A Value MUST have a text.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='SpecificationIdentification']">
            <assert id="PEPPOL-T012-R010" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A SpecificationIdentification MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
            <assert id="PEPPOL-T012-R011" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:www.cenbii.eu:transaction:biitrdm100:ver3.0:extended:urn:fdc:peppol.eu:2021:pracc:t012:ver1.0']">SpecificationIdentification value MUST be 'urn:www.cenbii.eu:transaction:biitrdm100:ver3.0:extended:urn:fdc:peppol.eu:2021:pracc:t012:ver1.0'.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='BusinessProcessTypeIdentifier']">
            <assert id="PEPPOL-T012-R012" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A BusinessProcessTypeIdentifier MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
            <assert id="PEPPOL-T012-R013" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']/rim:Value/text()[normalize-space() = 'urn:fdc:peppol.eu:2020:pracc:p006:01:1.0']">BusinessProcessTypeIdentifier value MUST be 'urn:fdc:peppol.eu:2020:pracc:p006:01:1.0'.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='IssueDateTime']">
            <assert id="PEPPOL-T012-R014" flag="fatal" test="rim:SlotValue[@xsi:type='rim:DateTimeValueType']">An IssueDateTime MUST have an element SlotValue with xsi:type of rim:DateTimeValueType.</assert>
            <assert id="PEPPOL-T012-R015" flag="fatal" test="rim:SlotValue[@xsi:type='rim:DateTimeValueType']/rim:Value">A value for IssueDateTime MUST be given.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='SenderElectronicAddress']">
            <assert id="PEPPOL-T012-R016" flag="fatal" test="matches(normalize-space(./@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">The Sender Electronic Address MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
            <assert id="PEPPOL-T012-R017" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A SenderElectronicAddress MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:Slot[@name='ReceiverElectronicAddress']">
            <assert id="PEPPOL-T012-R018" flag="fatal" test="matches(normalize-space(./@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">The Receiver Electronic Address MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
            <assert id="PEPPOL-T012-R019" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A ReceiverElectronicAddress MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject">
            <assert id="PEPPOL-T012-R020" flag="fatal" test="normalize-space(./@lid) != ''">The Registry Object List MUST have an attribute lid.</assert>
            <assert id="PEPPOL-T012-R021" flag="fatal" test="@xsi:type='rim:ExtrinsicObjectType'">An EndpointId MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
            <assert id="PEPPOL-T012-R022" flag="fatal" test="rim:Slot[@name='BuyerElectronicAddress']">A Notice QueryResponse MUST identify the Receiver by its party identifier and its BuyerElectronicAddress.</assert>
            <assert id="PEPPOL-T012-R023" flag="fatal" test="rim:Slot[@name='DocumentTypeCode']">A Registry Object MUST have a Document Type Code.</assert>
            <assert id="PEPPOL-T012-R024" flag="fatal" test="rim:RepositoryItemRef">A Registry Object MUST have a Repository Item Reference.</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='BuyerElectronicAddress']">
            <assert id="PEPPOL-T012-R025" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A BuyerElectronicAddress MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
            <assert id="PEPPOL-T012-R026" flag="fatal" test="matches(normalize-space(./@type), '^(FR:SIRENE|SE:ORGNR|FR:SIRET|FI:OVT|DUNS|GLN|DK:P|IT:FTI|NL:KVK|IT:SIA|IT:SECETI|DK:CPR|DK:CVR|DK:SE|DK:VANS|IT:VAT|IT:CF|NO:ORGNR|NO:VAT|HU:VAT|EU:REID|AT:VAT|AT:GOV|IS:KT|IBAN|AT:KUR|ES:VAT|IT:IPA|AD:VAT|AL:VAT|BA:VAT|BE:VAT|BG:VAT|CH:VAT|CY:VAT|CZ:VAT|DE:VAT|EE:VAT|GB:VAT|GR:VAT|HR:VAT|IE:VAT|LI:VAT|LT:VAT|LU:VAT|LV:VAT|MC:VAT|ME:VAT|MK:VAT|MT:VAT|NL:VAT|PL:VAT|PT:VAT|RO:VAT|RS:VAT|SI:VAT|SK:VAT|SM:VAT|TR:VAT|VA:VAT|NL:ION|SE:VAT|ZZZ)$')">The Buyer Electronic Address Scheme MUST be from the list of PEPPOL Party Identifiers described in the "PEPPOL Policy for using Identifiers".</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:Slot[@name='DocumentTypeCode']">
            <assert id="PEPPOL-T012-R027" flag="fatal" test="rim:SlotValue[@xsi:type='rim:StringValueType']">A Document Type Code MUST have an element SlotValue with xsi:type of rim:StringValueType.</assert>
            <assert id="PEPPOL-T011-R028" flag="fatal" test="@type = 'http://docs.peppol.eu/document-type-code'">The @type for rim:Slot "DocumentTypeCode" MUST be: list to be created</assert>
        </rule>

        <rule context="query:QueryResponse/rim:RegistryObjectList/rim:RegistryObject/rim:RepositoryItemRef">
            <assert id="PEPPOL-T011-R029" flag="fatal" test="matches(normalize-space(./@xlink:href), '.*[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}.*')">The xlink:href MUST be expressed in a UUID syntax (RFC 4122).</assert>
        </rule>

    </pattern>
</schema>
