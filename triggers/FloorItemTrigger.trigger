trigger FloorItemTrigger on Floor_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorItemHandler.handleAfterDelete(Trigger.old);
    }
}
