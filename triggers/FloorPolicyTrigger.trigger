trigger FloorPolicyTrigger on Floor_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
