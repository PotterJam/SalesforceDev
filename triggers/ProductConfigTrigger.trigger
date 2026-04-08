trigger ProductConfigTrigger on Product_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProductConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProductConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProductConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProductConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProductConfigHandler.handleAfterDelete(Trigger.old);
    }
}
