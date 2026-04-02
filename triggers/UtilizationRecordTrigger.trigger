trigger UtilizationRecordTrigger on Utilization_Record__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) UtilizationRecordHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRecordHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRecordHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) UtilizationRecordHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) UtilizationRecordHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) UtilizationRecordHandler.handleAfterDelete(Trigger.old);
    }
}
