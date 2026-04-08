trigger AlertActionTrigger on Alert_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertActionHandler.handleAfterDelete(Trigger.old);
    }
}
