trigger ResolutionTransformTrigger on Resolution_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResolutionTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResolutionTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResolutionTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResolutionTransformHandler.handleAfterDelete(Trigger.old);
    }
}
