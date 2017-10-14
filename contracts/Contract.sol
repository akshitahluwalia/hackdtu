pragma solidity ^0.4.8;
contract Contract {

    struct Report{
    address     reporter;
    string      name;
    string      report_type;
    string      desc;
    address     officer;
    uint        report_status;
    address     investigator;
    string      investigation;
    string      verdict;
    address     jury;
    }

    Report[] public reports;
    uint curr;

    function Contract(){
        reports.length = 15;
    }

    function getUserReportsIndexes(address _user) constant returns(uint[] mreport){
        uint[] memory data = new uint[](15);
        uint last = 0;
        for(uint i;i < reports.length;i++){
            if(reports[i].reporter == _user){
                data[last] = i;
                last++;
            }
        }
        return data;
    }

    function getUserReportByIndex(uint _index) constant returns(address reporter,string name,string report_type,string desc,address officer,uint report_status,address investigator,string investigation,string verdict,address jury){
        Report storage mReport = reports[_index];
        return (mReport.reporter,mReport.name,mReport.report_type,mReport.desc,mReport.officer,mReport.report_status,mReport.investigator,mReport.investigation,mReport.verdict,mReport.jury);
    }

    function createUserReport(string name, string desc,string report_type){
        reports[curr].reporter = msg.sender;
        reports[curr].name = name;
        reports[curr].desc = desc;
        reports[curr].report_type = report_type;
        curr++;
    }

    function getReportStatus(uint _index) constant returns(uint){
        // 0 => Just Created
        // 1 => Just Approved
        // 2 => Investigation completed
        // 3 => Verdict placed
        return reports[_index].report_status;
    }

    function setReportStatus(uint _index,uint _value){
        // 0 => Just Created
        // 1 => Just Approved
        // 2 => Investigation completed
        // 3 => Verdict placed
        reports[_index].report_status = _value;
    }

    function setInvestigationReport(uint _index,string _report){
        reports[_index].investigation = _report;
        reports[_index].investigator = msg.sender;
    }

    function setVerdict(uint _index,string _report){
        reports[_index].verdict = _report;
        reports[_index].jury = msg.sender;
    }

    function getVerdict(uint _index) constant returns(string){
        return reports[_index].verdict;
    }

    function getInvestigationReport(uint _index) constant returns(string){
        return reports[_index].investigation;
    }
}