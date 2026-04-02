trigger SupportNodeTrigger on Support_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportNodeHandler.handleAfterDelete(Trigger.old);
    }
}
