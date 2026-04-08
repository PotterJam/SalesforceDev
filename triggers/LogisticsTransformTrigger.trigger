trigger LogisticsTransformTrigger on Logistics_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsTransformHandler.handleAfterDelete(Trigger.old);
    }
}
