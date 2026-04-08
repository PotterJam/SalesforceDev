trigger AlertControllerTrigger on Alert_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertControllerHandler.handleAfterDelete(Trigger.old);
    }
}
