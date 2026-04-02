trigger ActualDetailTrigger on Actual_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ActualDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ActualDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ActualDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ActualDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ActualDetailHandler.handleAfterDelete(Trigger.old);
    }
}
