trigger FrequencyCatalogTrigger on Frequency_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FrequencyCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FrequencyCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FrequencyCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FrequencyCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
