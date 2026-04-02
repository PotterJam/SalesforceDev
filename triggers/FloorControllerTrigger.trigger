trigger FloorControllerTrigger on Floor_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorControllerHandler.handleAfterDelete(Trigger.old);
    }
}
