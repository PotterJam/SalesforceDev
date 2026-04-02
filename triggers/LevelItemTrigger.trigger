trigger LevelItemTrigger on Level_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelItemHandler.handleAfterDelete(Trigger.old);
    }
}
