trigger LevelNodeTrigger on Level_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelNodeHandler.handleAfterDelete(Trigger.old);
    }
}
