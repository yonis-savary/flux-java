for file in ../entity/*.java; do
    class=$(basename "$file" .java)


    gotUUID=$(cat "$file" | grep "Serializable uuid" | wc -l)

    if [ "$gotUUID" = "0" ]; then
        pkType="Integer"
        pkImport=""
    else
        pkType="Serializable"
        pkImport="import java.io.Serializable;"
    fi

    cat <<EOF > ./${class}Repository.java
package com.flux.flux_api.generated.repository;

$pkImport
import org.springframework.data.jpa.repository.JpaRepository;
import com.flux.flux_api.generated.entity.${class};

public interface ${class}Repository extends JpaRepository<${class}, $pkType> {
}
EOF
done
