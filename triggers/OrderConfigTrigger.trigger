trigger OrderConfigTrigger on Order_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderConfigHandler.handleAfterDelete(Trigger.old);
    }
}
