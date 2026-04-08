trigger ReportMappingTrigger on Report_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportMappingHandler.handleAfterDelete(Trigger.old);
    }
}
