trigger LogisticsProcessTrigger on Logistics_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsProcessHandler.handleAfterDelete(Trigger.old);
    }
}
