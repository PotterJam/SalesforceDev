trigger TagNodeTrigger on Tag_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagNodeHandler.handleAfterDelete(Trigger.old);
    }
}
