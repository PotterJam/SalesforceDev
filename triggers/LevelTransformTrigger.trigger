trigger LevelTransformTrigger on Level_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelTransformHandler.handleAfterDelete(Trigger.old);
    }
}
