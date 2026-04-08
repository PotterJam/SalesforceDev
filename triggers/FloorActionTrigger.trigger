trigger FloorActionTrigger on Floor_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorActionHandler.handleAfterDelete(Trigger.old);
    }
}
