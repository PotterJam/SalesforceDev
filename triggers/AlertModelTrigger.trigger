trigger AlertModelTrigger on Alert_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertModelHandler.handleAfterDelete(Trigger.old);
    }
}
