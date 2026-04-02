trigger ReportItemTrigger on Report_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReportItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReportItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReportItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReportItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReportItemHandler.handleAfterDelete(Trigger.old);
    }
}
