trigger ImpactTransformTrigger on Impact_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ImpactTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ImpactTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ImpactTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ImpactTransformHandler.handleAfterDelete(Trigger.old);
    }
}
