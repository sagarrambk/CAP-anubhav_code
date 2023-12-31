namespace <%= projectName %>.db;

entity Sales {
  key ID       : Integer;
      region   : String(100);
      country  : String(100);
      org      : String(4);
      amount   : Integer;
      comments : String(100);
};

<% if(em){ -%>
using { cuid, managed } from '@sap/cds/common';

<% if(apiS4HCSO){ -%>
entity SalesOrdersLog : cuid, managed {
      salesOrder         : String;
      incotermsLocation1 : String;
};
<% } -%>

<% if(apiS4HCBP){ -%>
using { sap.common.CodeList } from '@sap/cds/common';

entity CustomerProcesses : cuid {
      customerName       : String;
      customerId         : String;
      customerPhone      : String;
      customerLanguage   : String;
      customerCountry    : String;
      customerMail       : String;
      customerCity       : String;
      comment            : String(1111) default 'Initial';
      criticality        : Integer      default 1;
      backendEventTime   : String;
      backendEventType   : String;
      backendEventSource : String;
      backendURL         : String;
      status             : Association to Status;
      customerCondition  : Association to Conditions;
};

entity Conditions : CodeList {
  key conditionId : Integer;
};

entity Status : CodeList {
  key statusId : Integer;
};
<% } -%>

<% if(apiSFSFRC){ -%>
entity CandidatesLog : cuid, managed {
      candidateId : Integer;
      cellPhone   : String;
};
<% } -%>
<% } -%>