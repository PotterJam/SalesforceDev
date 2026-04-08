trigger QualityProcessTrigger on Quality_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityProcessHandler.handleAfterDelete(Trigger.old);
    }
}
