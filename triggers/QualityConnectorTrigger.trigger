trigger QualityConnectorTrigger on Quality_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
