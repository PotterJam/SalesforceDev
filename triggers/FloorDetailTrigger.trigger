trigger FloorDetailTrigger on Floor_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorDetailHandler.handleAfterDelete(Trigger.old);
    }
}
