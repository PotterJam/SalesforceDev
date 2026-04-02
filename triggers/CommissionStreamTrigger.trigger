trigger CommissionStreamTrigger on Commission_Stream__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionStreamHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionStreamHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionStreamHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionStreamHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionStreamHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionStreamHandler.handleAfterDelete(Trigger.old);
    }
}
