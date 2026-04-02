trigger ResearchTransformTrigger on Research_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResearchTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResearchTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResearchTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResearchTransformHandler.handleAfterDelete(Trigger.old);
    }
}
