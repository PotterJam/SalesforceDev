trigger ResolutionControllerTrigger on Resolution_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionControllerHandler.handleAfterDelete(Trigger.old);
    }
}
