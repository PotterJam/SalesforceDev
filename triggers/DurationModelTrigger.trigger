trigger DurationModelTrigger on Duration_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationModelHandler.handleAfterDelete(Trigger.old);
    }
}
