trigger LogisticsCatalogTrigger on Logistics_Catalog__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsCatalogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsCatalogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsCatalogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsCatalogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsCatalogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsCatalogHandler.handleAfterDelete(Trigger.old);
    }
}
