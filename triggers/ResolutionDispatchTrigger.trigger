trigger ResolutionDispatchTrigger on Resolution_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
