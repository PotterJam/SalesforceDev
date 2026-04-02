trigger LogisticsArchiveTrigger on Logistics_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
