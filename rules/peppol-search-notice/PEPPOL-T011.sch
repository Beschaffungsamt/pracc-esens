<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
    <title>eSENS business and syntax rules for search notice request</title>

    <ns prefix="rim" uri="urn:oasis:names:tc:ebxml-regrep:xsd:rim:4.0"/>
    <ns prefix="query" uri="urn:oasis:names:tc:ebxml-regrep:xsd:query:4.0"/>

    <pattern>
        <rule context="//query:QueryRequest">
            <assert id="PEPPOL-T011-R001" flag="fatal" test="(rim:Slot[@name='SpecificationIdentification'])">A Search Notice Request MUST have a specification identification.</assert>
            <assert id="PEPPOL-T011-R002" flag="fatal" test="(rim:Slot[@name='BusinessProcessTypeIdentifier'])">A Search Notice Request MUST have a business process type identifier.</assert>
            <assert id="PEPPOL-T011-R003" flag="fatal" test="(rim:Slot[@name='Issue'])">A Search Notice Request MUST have a issue dateTime.</assert>
            <assert id="PEPPOL-T011-R004" flag="fatal" test="(rim:Slot[@name='SenderElectronicAddress'])">A Search Notice Request MUST have a sender electronic address.</assert>
            <assert id="PEPPOL-T011-R005" flag="fatal" test="(rim:Slot[@name='ReceiverElectronicAddress'])">A Search Notice Request MUST have a receiver electronic address.</assert>
            <assert id="PEPPOL-T011-R006" flag="fatal" test="(query:Query[@queryDefinition='SearchNotice'])">A Search Notice Request MUST have a Query with a queryDefinition set to 'SearchNotice'.</assert>
        </rule>
    </pattern>

</schema>
